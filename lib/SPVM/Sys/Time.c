#include "spvm_native.h"

#include <time.h>
#include <sys/time.h>
#include <errno.h>

static const char* FILE_NAME = "Sys/Time.c";

int32_t SPVM__Sys__Time__gettimeofday(SPVM_ENV* env, SPVM_VALUE* stack) {
  (void)env;
  (void)stack;
  
  void* obj_tv = stack[0].oval;
  
  struct timeval* st_tv = NULL;
  if (obj_tv) {
    st_tv = env->get_pointer(env, stack, obj_tv);
  }
  
  void* obj_tz = stack[1].oval;
  
  struct timezone* st_tz = NULL;
  if (obj_tz) {
    st_tz = env->get_pointer(env, stack, obj_tz);
  }
  
  int32_t status = gettimeofday(st_tv, st_tz);
  
  if (status == -1) {
    env->die(env, stack, "[System Error]gettimeofday failed:%s.", env->strerror(env, stack, errno, 0), FILE_NAME, __LINE__);
    return SPVM_NATIVE_C_CLASS_ID_ERROR_SYSTEM;
  }
  
  stack[0].ival = status;
  
  return 0;
}

int32_t SPVM__Sys__Time__clock(SPVM_ENV* env, SPVM_VALUE* stack) {
  (void)env;
  (void)stack;
  
  int64_t cpu_time = clock();
  
  if (cpu_time == -1) {
    env->die(env, stack, "[System Error]clock failed:%s.", env->strerror(env, stack, errno, 0), FILE_NAME, __LINE__);
    return SPVM_NATIVE_C_CLASS_ID_ERROR_SYSTEM;
  }
  
  stack[0].lval = cpu_time;
  
  return 0;
}

int32_t SPVM__Sys__Time__clock_gettime(SPVM_ENV* env, SPVM_VALUE* stack) {
  (void)env;
  (void)stack;
  
  int32_t clk_id = stack[0].ival;
  
  void* obj_tp = stack[1].oval;
  
  struct timespec* st_tp = NULL;
  if (obj_tp) {
    st_tp = env->get_pointer(env, stack, obj_tp);
  }
  else {
    return env->die(env, stack, "The tp must be defined", FILE_NAME, __LINE__);
  }
  
  int32_t status = clock_gettime(clk_id, st_tp);
  
  if (status == -1) {
    env->die(env, stack, "[System Error]clock_gettime failed:%s.", env->strerror(env, stack, errno, 0), FILE_NAME, __LINE__);
    return SPVM_NATIVE_C_CLASS_ID_ERROR_SYSTEM;
  }
  
  stack[0].ival = status;
  
  return 0;
}

int32_t SPVM__Sys__Time__clock_getres(SPVM_ENV* env, SPVM_VALUE* stack) {
  (void)env;
  (void)stack;
  
  int32_t clk_id = stack[0].ival;
  
  void* obj_res = stack[1].oval;
  
  struct timespec* st_res = NULL;
  if (obj_res) {
    st_res = env->get_pointer(env, stack, obj_res);
  }
  else {
    return env->die(env, stack, "The res must be defined", FILE_NAME, __LINE__);
  }
  
  int32_t status = clock_getres(clk_id, st_res);
  
  if (status == -1) {
    env->die(env, stack, "[System Error]clock_getres failed:%s.", env->strerror(env, stack, errno, 0), FILE_NAME, __LINE__);
    return SPVM_NATIVE_C_CLASS_ID_ERROR_SYSTEM;
  }
  
  stack[0].ival = status;
  
  return 0;
}
