# At least for time being I'm pinned to version 2021.5.5.
# The devs started to remove configuration.yaml settings and move it to clicked interface - which is a big issue to me.
FROM homeassistant/home-assistant:2021.5.5

ARG custom_branch_name=test-branch

# upstream image comes with BusyBox tar and does not support wildcard include patterns
RUN apk --no-cache add tar

RUN curl -L https://api.github.com/repos/mlewand/home-assistant/tarball/${custom_branch_name} | tar xz --strip-components=1 -C /usr/src/homeassistant --wildcards '*/homeassistant/components/recorder/*'

CMD python3 -m homeassistant --config /config