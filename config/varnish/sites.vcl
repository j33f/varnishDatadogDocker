backend default {
    .host = "192.168.1.100";
    .port = "8000";
}

sub vcl_recv {

    set req.backend = default;
    return(lookup);
}

sub vcl_miss {

    return(fetch);
}

sub vcl_hit {

    return(deliver);
}

sub vcl_fetch {

    set beresp.ttl = 1h;

    set beresp.http.X-Cacheable = "YES";

    unset beresp.http.Vary;

    return(deliver);
}

sub vcl_deliver {

    return(deliver);
}