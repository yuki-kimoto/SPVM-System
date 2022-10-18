#include "spvm_native.h"

#ifdef _WIN32
#  include <winsock2.h>
#else
#  include <sys/ioctl.h>
#endif


const char* FILE_NAME = "Sys/Ioctl.c";

int32_t SPVM__Sys__Ioctl__ioctl(SPVM_ENV* env, SPVM_VALUE* stack) {

  int32_t e = 0;
  
  int32_t items = env->get_args_stack_length(env, stack);
  
  int32_t fd = stack[0].ival;
  
  int32_t request = stack[1].ival;
  
  int32_t ret;

  void* obj_request_arg = stack[2].oval;
  
#ifdef _WIN32
    
    if (!obj_request_arg) {
      return env->die(env, stack, "The $request_arg must be an Int object", FILE_NAME, __LINE__);
    }
    else {
      int32_t request_arg_basic_type_id = env->get_object_basic_type_id(env, stack, obj_request_arg);
      int32_t request_arg_type_dimension = env->get_object_type_dimension(env, stack, obj_request_arg);

      if (request_arg_basic_type_id == SPVM_NATIVE_C_BASIC_TYPE_ID_INT_CLASS && request_arg_type_dimension == 0) {
        int32_t request_arg_int32 = env->get_field_int_by_name(env, stack, obj_request_arg, "Int", "value", &e, FILE_NAME, __LINE__);
        if (e) { return e; }
        
        ret = ioctlsocket(fd, request, &request_arg_int32);

        env->set_field_int_by_name(env, stack, obj_request_arg, "Int", "value", request_arg_int32, &e, FILE_NAME, __LINE__);
        if (e) { return e; }
      }
      else {
        return env->die(env, stack, "The $request_arg must be an Int object", FILE_NAME, __LINE__);
      }
    }
  }
#else
  if (items <= 2) {
    ret = ioctl(fd, request);
  }
  else {
    void* obj_request_arg = stack[2].oval;
    
    if (!obj_request_arg) {
      ret = ioctl(fd, request, NULL);
    }
    else {
      int32_t request_arg_basic_type_id = env->get_object_basic_type_id(env, stack, obj_request_arg);
      int32_t request_arg_type_dimension = env->get_object_type_dimension(env, stack, obj_request_arg);

      if (!(request_arg_basic_type_id == SPVM_NATIVE_C_BASIC_TYPE_ID_INT_CLASS && request_arg_type_dimension == 0)) {
        return env->die(env, stack, "The $request_arg must be an Int object on Windows", FILE_NAME, __LINE__);
      }
      
      // Byte
      if (request_arg_basic_type_id == SPVM_NATIVE_C_BASIC_TYPE_ID_BYTE_CLASS && request_arg_type_dimension == 0) {
        int8_t request_arg_int8 = env->get_field_byte_by_name(env, stack, obj_request_arg, "Byte", "value", &e, FILE_NAME, __LINE__);
        if (e) { return e; }
        
        ret = ioctl(fd, request, &request_arg_int8);

        env->set_field_byte_by_name(env, stack, obj_request_arg, "Byte", "value", request_arg_int8, &e, FILE_NAME, __LINE__);
        if (e) { return e; }
      }
      // Short
      else if (request_arg_basic_type_id == SPVM_NATIVE_C_BASIC_TYPE_ID_SHORT_CLASS && request_arg_type_dimension == 0) {
        int16_t request_arg_int16 = env->get_field_short_by_name(env, stack, obj_request_arg, "Short", "value", &e, FILE_NAME, __LINE__);
        if (e) { return e; }
        
        ret = ioctl(fd, request, &request_arg_int16);

        env->set_field_short_by_name(env, stack, obj_request_arg, "Short", "value", request_arg_int16, &e, FILE_NAME, __LINE__);
        if (e) { return e; }
      }
      // Int
      else if (request_arg_basic_type_id == SPVM_NATIVE_C_BASIC_TYPE_ID_INT_CLASS && request_arg_type_dimension == 0) {
        int32_t request_arg_int32 = env->get_field_int_by_name(env, stack, obj_request_arg, "Int", "value", &e, FILE_NAME, __LINE__);
        if (e) { return e; }
        
        ret = ioctl(fd, request, &request_arg_int32);

        env->set_field_int_by_name(env, stack, obj_request_arg, "Int", "value", request_arg_int32, &e, FILE_NAME, __LINE__);
        if (e) { return e; }
      }
      // Long
      else if (request_arg_basic_type_id == SPVM_NATIVE_C_BASIC_TYPE_ID_LONG_CLASS && request_arg_type_dimension == 0) {
        int64_t request_arg_int64 = env->get_field_long_by_name(env, stack, obj_request_arg, "Long", "value", &e, FILE_NAME, __LINE__);
        if (e) { return e; }
        
        ret = ioctl(fd, request, &request_arg_int64);

        env->set_field_long_by_name(env, stack, obj_request_arg, "Long", "value", request_arg_int64, &e, FILE_NAME, __LINE__);
        if (e) { return e; }
      }
      // Float
      else if (request_arg_basic_type_id == SPVM_NATIVE_C_BASIC_TYPE_ID_FLOAT_CLASS && request_arg_type_dimension == 0) {
        float request_arg_float = env->get_field_float_by_name(env, stack, obj_request_arg, "Float", "value", &e, FILE_NAME, __LINE__);
        if (e) { return e; }
        
        ret = ioctl(fd, request, &request_arg_float);

        env->set_field_float_by_name(env, stack, obj_request_arg, "Float", "value", request_arg_float, &e, FILE_NAME, __LINE__);
        if (e) { return e; }
      }
      // Double
      else if (request_arg_basic_type_id == SPVM_NATIVE_C_BASIC_TYPE_ID_DOUBLE_CLASS && request_arg_type_dimension == 0) {
        double request_arg_double = env->get_field_double_by_name(env, stack, obj_request_arg, "Double", "value", &e, FILE_NAME, __LINE__);
        if (e) { return e; }
        
        ret = ioctl(fd, request, &request_arg_double);

        env->set_field_double_by_name(env, stack, obj_request_arg, "Double", "value", request_arg_double, &e, FILE_NAME, __LINE__);
        if (e) { return e; }
      }
      // A pointer class
      else if (env->is_pointer_class(env, stack, obj_request_arg)) {
        void* request_arg = env->get_pointer(env, stack, obj_request_arg);
        ret = ioctl(fd, request, request_arg);
      }
      else {
        return env->die(env, stack, "The $request_arg must be an Byte/Short/Int/Long/Float/Double object or the object that is a pointer class", FILE_NAME, __LINE__);
      }
    }
  }

#endif

  stack[0].ival = ret;
  
  return 0;
}