#include "spvm_native.h"

#include <stdlib.h>
#include <errno.h>

static const char* FILE_NAME = "Sys/Env.c";

int32_t SPVM__Sys__Env__getenv(SPVM_ENV* env, SPVM_VALUE* stack) {

  void* obj_name = stack[0].oval;
  
  if (!obj_name) {
    return env->die(env, stack, "The name must be defined", __func__, FILE_NAME, __LINE__);
  }
  
  const char* name = env->get_chars(env, stack, obj_name);
  
  char* value = getenv(name);
  
  void* obj_value;
  if (value) {
    obj_value = env->new_string(env, stack, value, strlen(value));
  }
  else {
    obj_value = NULL;
  }
  
  stack[0].oval = obj_value;
  
  return 0;
}

int32_t SPVM__Sys__Env__setenv(SPVM_ENV* env, SPVM_VALUE* stack) {
#ifdef _WIN32
  env->die(env, stack, "setenv is not supported on this system", __func__, FILE_NAME, __LINE__);
  return SPVM_NATIVE_C_CLASS_ID_ERROR_NOT_SUPPORTED;
#else
  void* obj_name = stack[0].oval;
  if (!obj_name) {
    return env->die(env, stack, "The name must be defined", __func__, FILE_NAME, __LINE__);
  }
  const char* name = env->get_chars(env, stack, obj_name);

  void* obj_value = stack[1].oval;
  if (!obj_value) {
    return env->die(env, stack, "The value must be defined", __func__, FILE_NAME, __LINE__);
  }
  const char* value = env->get_chars(env, stack, obj_value);
  
  int32_t overwrite = stack[2].ival;
  
  int32_t status = setenv(name, value, overwrite);

  if (status == -1) {
    env->die(env, stack, "[System Error]setenv failed:%s.", env->strerror(env, stack, errno, 0), __func__, FILE_NAME, __LINE__);
    return SPVM_NATIVE_C_CLASS_ID_ERROR_SYSTEM;
  }
  
  stack[0].ival = status;
  
  return 0;
#endif
}

int32_t SPVM__Sys__Env__unsetenv(SPVM_ENV* env, SPVM_VALUE* stack) {
#ifdef _WIN32
  env->die(env, stack, "unsetenv is not supported on this system", __func__, FILE_NAME, __LINE__);
  return SPVM_NATIVE_C_CLASS_ID_ERROR_NOT_SUPPORTED;
#else
  void* obj_name = stack[0].oval;
  if (!obj_name) {
    return env->die(env, stack, "The name must be defined", __func__, FILE_NAME, __LINE__);
  }
  const char* name = env->get_chars(env, stack, obj_name);

  int32_t status = unsetenv(name);

  if (status == -1) {
    env->die(env, stack, "[System Error]unsetenv failed:%s.", env->strerror(env, stack, errno, 0), __func__, FILE_NAME, __LINE__);
    return SPVM_NATIVE_C_CLASS_ID_ERROR_SYSTEM;
  }
  
  stack[0].ival = status;
  
  return 0;
#endif
}