# fluent-plugin-record-serializer

[fluentd](http://fluentd.org) filter plugin that serialize a record.

[![Build Status](https://travis-ci.org/cooldaemon/fluent-plugin-record-serializer.svg?branch=master)](https://travis-ci.org/cooldaemon/fluent-plugin-record-serializer)
[![Code Climate](https://codeclimate.com/github/cooldaemon/fluent-plugin-record-serializer/badges/gpa.svg)](https://codeclimate.com/github/cooldaemon/fluent-plugin-record-serializer)

If following record is passed:

```
{"message": "hello world!"}
```

then you got new record like below:

```
{"tag": "pattern", "payload": "{\"message\": \"hello world!\"}"}
```

## Installation

Install with gem or fluent-gem command as:

```
# for fluentd
$ gem install fluent-plugin-record-serializer

# for td-agent
$ sudo /usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-record-serializer
```

## Configuration

In v0.14 or v0.12, you can use record_modifier filter.

```
<filter pattern>
  type record_serializer
</filter>
```

In v0.10, you can use record_serializer output to emulate filter.

```
<match pattern>
  type record_serializer
  tag serialized.pattern
</match>
```

## Copyright

- Copyright
  - Copyright(C) 2015- IKUTA Masahito (cooldaemon)
- License
  - Apache License, Version 2.0
