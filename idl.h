#ifndef __PORBIT_IDL_H__
#define __PORBIT_IDL_H__

#include <orb/orbit.h>

CORBA_boolean porbit_parse_idl_file (const char *file, 
				     const char *includes,
				     const char *caller);

#endif /* __PORBIT_IDL_H__ */
