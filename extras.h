/* -*- mode: C; c-file-style: "bsd" -*- */

#ifndef __PORBIT_EXTRAS_H__
#define __PORBIT_EXTRAS_H__

#include "porbit-perl.h"
#include <orb/orbit.h>

typedef struct _PORBitSource PORBitSource;

struct _PORBitSource {
    guint ref_count;
    int id;
    AV *args;
};

PORBitSource *porbit_source_new       (void);
PORBitSource *porbit_source_ref       (PORBitSource *source);
void          porbit_source_unref     (PORBitSource *source);
void          porbit_source_destroyed (PORBitSource *source);

void porbit_set_cookie (const char *cookie);
void porbit_set_use_gmain (gboolean set);
void porbit_set_check_cookies (gboolean set);

#endif /* __PORBIT_EXTRAS_H__ */
