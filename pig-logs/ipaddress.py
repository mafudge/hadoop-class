#!/usr/bin/python2

if __name__ != '__lib__':
        def outputSchema(empty):
                return lambda x: x


@outputSchema('ipnumber:long')
def toNumber(ip):
        parts = ip.split('.')
        return (long(parts[0]) << 24) + (long(parts[1]) << 16) + (long(parts[2]) << 8) + long(parts[3]);

