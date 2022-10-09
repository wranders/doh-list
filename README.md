# doh-list

A list of DNS-over-HTTPS (DoH) providers programatically gathered from the
[curl/curl wiki](https://github.com/curl/curl/wiki/DNS-over-HTTPS).

This list can be used to block DoH requests at the DNS-level, since the host
names still need to be resolved.

Add the following as a remote block list:

```sh
https://raw.githubusercontent.com/wranders/doh-list/master/doh-list.txt
```

The wiki is checked everyday for changes and publishes a new list if changes are
found.

## License

This repository itself is provided under the MIT license.

Since the source data is in the
[curl/curl wiki](https://github.com/curl/curl/wiki/DNS-over-HTTPS), I will also
link to the MIT/X-inspired [curl license](https://curl.se/docs/copyright.html).
