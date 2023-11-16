// Copyright (c) 2023 Yuki Kimoto
// MIT License

#include "spvm_native.h"

#include <unistd.h>
#include <sys/types.h>
#include <errno.h>
#include <signal.h>
#include <stdlib.h>
#include <assert.h>
#include <stdio.h>

static const char* FILE_NAME = "Sys/Signal.c";

int32_t SPVM__Sys__Signal__kill(SPVM_ENV* env, SPVM_VALUE* stack) {
#if defined(_WIN32)
  env->die(env, stack, "kill is not supported in this system(defined(_WIN32)).", __func__, FILE_NAME, __LINE__);
  return SPVM_NATIVE_C_BASIC_TYPE_ID_ERROR_NOT_SUPPORTED_CLASS;
#else
  
  int32_t pid = stack[0].ival;
  int32_t sig = stack[1].ival;
  
  int32_t status = kill(pid, sig);
  if (status == -1) {
    env->die(env, stack, "[System Error]kill failed:%s.", env->strerror(env, stack, errno, 0), __func__, FILE_NAME, __LINE__);
    return SPVM_NATIVE_C_BASIC_TYPE_ID_ERROR_SYSTEM_CLASS;
  }
  
  stack[0].ival = status;
  
  return 0;
#endif
}

int32_t SPVM__Sys__Signal__raise(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  int32_t sig = stack[0].ival;
  
  int32_t status = raise(sig);
  if (status != 0) {
    env->die(env, stack, "[System Error]raise failed:%s.", env->strerror(env, stack, errno, 0), __func__, FILE_NAME, __LINE__);
    return SPVM_NATIVE_C_BASIC_TYPE_ID_ERROR_SYSTEM_CLASS;
  }
  
  stack[0].ival = status;
  
  return 0;
}

int32_t SPVM__Sys__Signal__alarm(SPVM_ENV* env, SPVM_VALUE* stack) {
#if defined(_WIN32)
  env->die(env, stack, "alarm is not supported in this system(defined(_WIN32)).", __func__, FILE_NAME, __LINE__);
  return SPVM_NATIVE_C_BASIC_TYPE_ID_ERROR_NOT_SUPPORTED_CLASS;
#else
  
  int32_t seconds = stack[0].ival;
  
  int32_t rest_time = alarm(seconds);
  
  stack[0].ival = rest_time;
  
  return 0;
#endif
}

int32_t SPVM__Sys__Signal__ualarm(SPVM_ENV* env, SPVM_VALUE* stack) {
#if defined(_WIN32)
  env->die(env, stack, "ualarm is not supported in this system(defined(_WIN32)).", __func__, FILE_NAME, __LINE__);
  return SPVM_NATIVE_C_BASIC_TYPE_ID_ERROR_NOT_SUPPORTED_CLASS;
#else
  
  int32_t usecs = stack[0].ival;

  if (!(usecs >= 0)) {
    return env->die(env, stack, "$usecs must be greater than or equal to 0.", __func__, FILE_NAME, __LINE__);
  }

  if (!(usecs < 1000000)) {
    return env->die(env, stack, "$usecs must be less than 1000000.", __func__, FILE_NAME, __LINE__);
  }

  int32_t interval = stack[1].ival;
  
  if (!(interval >= 0)) {
    return env->die(env, stack, "$usecs must be greater than 0.", __func__, FILE_NAME, __LINE__);
  }

  if (!(interval < 1000000)) {
    return env->die(env, stack, "$usecs must be less than 1000000.", __func__, FILE_NAME, __LINE__);
  }
  
  int32_t rest_usecs = ualarm(usecs, interval);
  
  stack[0].ival = rest_usecs;
  
  return 0;
#endif
}

int32_t SPVM__Sys__Signal__SIG_DFL(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  int32_t error_id = 0;
  
  void* obj_handler = env->new_pointer_object_by_name(env, stack, "Sys::Signal::Handler", SIG_DFL, &error_id, __func__, __FILE__, __LINE__);
  if (error_id) { return error_id; }
  
  stack[0].oval = obj_handler;
  
  return 0;
}

int32_t SPVM__Sys__Signal__SIG_IGN(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  int32_t error_id = 0;
  
  void* obj_handler = env->new_pointer_object_by_name(env, stack, "Sys::Signal::Handler", SIG_IGN, &error_id, __func__, __FILE__, __LINE__);
  if (error_id) { return error_id; }
  
  stack[0].oval = obj_handler;
  
  return 0;
}

int32_t SPVM__Sys__Signal__signal(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  int32_t error_id = 0;
  
  int32_t signum = stack[0].ival;
  
  void* obj_handler = stack[1].oval;
  
  if (!obj_handler) {
    return env->die(env, stack, "$handler must be defined.", __func__, FILE_NAME, __LINE__);
  }
  
  void* handler = env->get_pointer(env, stack, obj_handler);
  
  void* old_handler = signal(signum, handler);
  
  if (old_handler == SIG_ERR) {
    env->die(env, stack, "[System Error]signal failed:%s.", env->strerror(env, stack, errno, 0), __func__, FILE_NAME, __LINE__);
    return SPVM_NATIVE_C_BASIC_TYPE_ID_ERROR_SYSTEM_CLASS;
  }
  
  void* obj_old_handler = env->new_pointer_object_by_name(env, stack, "Sys::Signal::Handler", old_handler, &error_id, __func__, __FILE__, __LINE__);
  if (error_id) { return error_id; }
  
  stack[0].oval = obj_old_handler;
  
  return 0;
}

static int32_t signal_write_fds[64] = {0};

static void signal_hander_io(int32_t signal) {
  int32_t signal_write_fd = signal_write_fds[signal];
  
  int32_t write_length = write(signal_write_fd, &signal_write_fd, sizeof(int32_t));
}

int32_t SPVM__Sys__Signal__SIG_IO(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  int32_t error_id = 0;
  
  void* obj_handler = env->new_pointer_object_by_name(env, stack, "Sys::Signal::Handler", &signal_hander_io, &error_id, __func__, __FILE__, __LINE__);
  if (error_id) { return error_id; }
  
  stack[0].oval = obj_handler;
  
  return 0;
}

int32_t SPVM__Sys__Signal__signal_io(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  int32_t error_id = 0;
  
  int32_t signum = stack[0].ival;
  
  if (!(signum < 64)) {
    return env->die(env, stack, "$signum must be less than 64.", env->strerror(env, stack, errno, 0), __func__, FILE_NAME, __LINE__);
  }
  
  int32_t signal_write_fd = stack[1].ival;
  
  signal_write_fds[signum] = signal_write_fd;
  
  void* old_handler = signal(signum, &signal_hander_io);
  
  if (old_handler == SIG_ERR) {
    env->die(env, stack, "[System Error]signal failed:%s.", env->strerror(env, stack, errno, 0), __func__, FILE_NAME, __LINE__);
    return SPVM_NATIVE_C_BASIC_TYPE_ID_ERROR_SYSTEM_CLASS;
  }
  
  void* obj_old_handler = env->new_pointer_object_by_name(env, stack, "Sys::Signal::Handler", old_handler, &error_id, __func__, __FILE__, __LINE__);
  if (error_id) { return error_id; }
  
  stack[0].oval = obj_old_handler;
  
  return 0;
}
