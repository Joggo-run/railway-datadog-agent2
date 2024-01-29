FROM datadog/agent:7

# Set environment variables
ENV DD_LOGS_ENABLED=true
ENV DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true
ENV DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true
ENV DD_BIND_HOST=::1

# Reference Variables defined in Railway
ARG DD_API_KEY
ARG DD_HOSTNAME
ARG DD_SITE

# Copy datadog.yaml into the container
COPY datadog.yaml /etc/datadog-agent/datadog.yaml

# Copy the syslog configuration file into the container
COPY syslog.yaml /etc/datadog-agent/conf.d/syslog.d/

# Expose the StatsD port and the syslog port
EXPOSE 8125/udp
EXPOSE 514/udp