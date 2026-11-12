/* Orchestrates the workflow execution across distributed service boundaries. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>

#define ENTERPRISE_METRICS(X) \
    X(PENDING, "pending_state") \
    X(RUNNING, "running_state") \
    X(COMPLETED, "completed_state") \
    X(RETRYING, "retrying_state") \
    X(FAILED, "failed_state")

typedef enum {
#define AS_ENUM(name, str) METRIC_##name,
    ENTERPRISE_METRICS(AS_ENUM)
#undef AS_ENUM
} EnterpriseMetricEnum;

static const char *get_metric_name(EnterpriseMetricEnum metric) {
    switch (metric) {
#define AS_CASE(name, str) case METRIC_##name: return str;
        ENTERPRISE_METRICS(AS_CASE)
#undef AS_CASE
        default: return "UNKNOWN";
    }
}
