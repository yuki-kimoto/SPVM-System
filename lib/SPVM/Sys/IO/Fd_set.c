#include "spvm_native.h"

#include <assert.h>
#include <sys/select.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>

static const char* FILE_NAME = "Sys/IO/Fd_set.c";

int32_t SPVM__Sys__IO__Fd_set__new(SPVM_ENV* env, SPVM_VALUE* stack) {
  (void)env;
  (void)stack;

  int32_t e;

  int32_t data_length = ((FD_SETSIZE - 1) / 8) + 1;

  char* buf_fd_set = env->new_memory_stack(env, stack, data_length);
  
  void* obj_fd_set = env->new_pointer_by_name(env, stack, "Sys::IO::Fd_set", buf_fd_set, &e, FILE_NAME, __LINE__);
  if (e) { return e; }
  
  stack[0].oval = obj_fd_set;
  
  return 0;
}

int32_t SPVM__Sys__IO__Fd_set__DESTROY(SPVM_ENV* env, SPVM_VALUE* stack) {
  (void)env;
  (void)stack;
  
  // File handle
  void* obj_fd_set = stack[0].oval;
  
  char* buf_fd_set = env->get_pointer(env, stack, obj_fd_set);
  
  assert(buf_fd_set);
  
  env->free_memory_stack(env, stack, buf_fd_set);
  env->set_pointer(env, stack, obj_fd_set, NULL);
  
  return 0;
}