send_osc(1)

# NAME

send_osc - Sends a single OSC message

# SYNOPSIS

*send_osc* _port_ _path_ [,_types_] [_args_...]

# DESCRIPTION

send_osc sends an OSC message to the specified _port_ (UDP port number, or any
other address string supported by liblo). The message is delivered to _path_. If
the first argument following the path starts with a comma, it's interpreted as a
type string, specifying the OSC data types to be used for sending the message
arguments. Otherwise, send_osc automatically tries to use appropriate data
types. Valid integer and float values are sent as such, anything else is sent as
a string.

# AUTHOR

Dominic Sacré  <dominic.sacre@gmx.de>

# SEE ALSO

*dump_osc*(1), *liblo*(3)
