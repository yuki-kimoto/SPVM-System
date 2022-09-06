#include "spvm_native.h"

#include <assert.h>

#ifdef _WIN32
# include <ws2tcpip.h>
# include <io.h>
#else
# include <sys/fcntl.h>
# include <sys/types.h>
# include <sys/socket.h>
# include <netinet/in.h>
# include <netdb.h>
# include <arpa/inet.h>
# include <unistd.h>
# define closesocket(fd) close(fd)
#endif

const char* FILE_NAME = "Sys/Socket/Sockaddr/In6.c";

int32_t SPVM__Sys__Socket__Sockaddr__In6__new(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  int32_t e = 0;
  
  struct sockaddr_in6* socket_address = env->new_memory_stack(env, stack, sizeof(struct sockaddr_in6));

  void* obj_socket_address = env->new_pointer_by_name(env, stack, "Sys::Socket::Sockaddr::In6", socket_address, &e, FILE_NAME, __LINE__);
  if (e) { return e; }
  
  stack[0].oval = obj_socket_address;
  
  return 0;
}

int32_t SPVM__Sys__Socket__Sockaddr__In6__DESTROY(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  void* obj_socket_address = stack[0].oval;
  
  struct sockaddr_in6* socket_address = env->get_pointer(env, stack, obj_socket_address);
  
  if (socket_address) {
    env->free_memory_stack(env, stack, socket_address);
    env->set_pointer(env, stack, obj_socket_address, NULL);
  }
  
  return 0;
}

int32_t SPVM__Sys__Socket__Sockaddr__In6__sin6_family(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  void* obj_self = stack[0].oval;
  
  struct sockaddr_in6* socket_address = env->get_pointer(env, stack, obj_self);
  
  if (socket_address) {
    stack[0].ival = socket_address->sin6_family;
  }
  else {
    assert(0);
  }
  
  return 0;
}

int32_t SPVM__Sys__Socket__Sockaddr__In6__set_sin6_family(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  void* obj_self = stack[0].oval;
  
  struct sockaddr_in6* socket_address = env->get_pointer(env, stack, obj_self);
  
  if (socket_address) {
    socket_address->sin6_family = stack[1].ival;
  }
  else {
    assert(0);
  }
  
  return 0;
}

int32_t SPVM__Sys__Socket__Sockaddr__In6__sin6_scope_id(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  void* obj_self = stack[0].oval;
  
  struct sockaddr_in6* socket_address = env->get_pointer(env, stack, obj_self);
  
  if (socket_address) {
    stack[0].ival = socket_address->sin6_scope_id;
  }
  else {
    assert(0);
  }
  
  return 0;
}

int32_t SPVM__Sys__Socket__Sockaddr__In6__set_sin6_scope_id(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  void* obj_self = stack[0].oval;
  
  struct sockaddr_in6* socket_address = env->get_pointer(env, stack, obj_self);
  
  if (socket_address) {
    socket_address->sin6_scope_id = stack[1].ival;
  }
  else {
    assert(0);
  }
  
  return 0;
}

int32_t SPVM__Sys__Socket__Sockaddr__In6__sin6_flowinfo(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  void* obj_self = stack[0].oval;
  
  struct sockaddr_in6* socket_address = env->get_pointer(env, stack, obj_self);
  
  if (socket_address) {
    stack[0].ival = socket_address->sin6_flowinfo;
  }
  else {
    assert(0);
  }
  
  return 0;
}

int32_t SPVM__Sys__Socket__Sockaddr__In6__set_sin6_flowinfo(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  void* obj_self = stack[0].oval;
  
  struct sockaddr_in6* socket_address = env->get_pointer(env, stack, obj_self);
  
  if (socket_address) {
    socket_address->sin6_flowinfo = stack[1].ival;
  }
  else {
    assert(0);
  }
  
  return 0;
}

int32_t SPVM__Sys__Socket__Sockaddr__In__sin6_addr(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  int32_t e = 0;
  
  void* obj_self = stack[0].oval;
  
  struct sockaddr_in6* socket_address = env->get_pointer(env, stack, obj_self);
  
  if (socket_address) {
    struct in6_addr address = socket_address->sin6_addr;

    struct in6_addr* address_ret = env->new_memory_stack(env, stack, sizeof(struct in6_addr));
    *address_ret = address;

    void* obj_address_ret = env->new_pointer_by_name(env, stack, "Sys::Socket::In6_addr", address_ret, &e, FILE_NAME, __LINE__);
    if (e) { return e; }
    
    stack[0].oval = obj_address_ret;
    
  }
  else {
    assert(0);
  }
  
  return 0;
}

int32_t SPVM__Sys__Socket__Sockaddr__In__set_sin6_addr(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  void* obj_self = stack[0].oval;
  
  struct sockaddr_in6* socket_address = env->get_pointer(env, stack, obj_self);
  
  if (socket_address) {
    void* obj_address = stack[1].oval;
    struct in6_addr* address = env->get_pointer(env, stack, obj_address);

    socket_address->sin6_addr = *address;
  }
  else {
    assert(0);
  }
  
  return 0;
}

int32_t SPVM__Sys__Socket__Sockaddr__In6__sin6_port(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  void* obj_self = stack[0].oval;
  
  struct sockaddr_in6* socket_address = env->get_pointer(env, stack, obj_self);
  
  if (socket_address) {
    stack[0].sval = socket_address->sin6_port;
  }
  else {
    assert(0);
  }
  
  return 0;
}

int32_t SPVM__Sys__Socket__Sockaddr__In6__set_sin6_port(SPVM_ENV* env, SPVM_VALUE* stack) {
  
  void* obj_self = stack[0].oval;
  
  struct sockaddr_in6* socket_address = env->get_pointer(env, stack, obj_self);
  
  if (socket_address) {
    socket_address->sin6_port = stack[1].sval;
  }
  else {
    assert(0);
  }
  
  return 0;
}