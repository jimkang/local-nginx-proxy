# local-nginx-proxy

Sometimes, you need a proxy on your laptop so that a web app you're developing on localhost can make a request to a server that is responding without CORS headers that allow such requests.

This is a simple nginx config to set up a proxy. It's only been tested on Ubuntu, but I imagine it will work anywhere nginx runs.

# Usage

- Install nginx. On Ubuntu: `sudo apt install nginx`.
- Clone this repo.
- Edit `default.nginx.conf` and edit `$proxy_dest_url` to point to the server you want to proxy to.
  - If you want, edit the location of the proxy.
  - By default, it's at `https://www.wikidata.org/yourpath?your=param`. So, if you want to proxy `http://localhost/proxy/w/api.php?action=wbgetentities&props=labels|sitelinks|claims&format=json&ids=Q192843`, you'd set `$proxy_dest_url` to `"https://www.wikidata.org/$1$is_args$args"` and in your web app, you'd make a request to `http://localhost/proxy/yourpath?your=param`.
- Install the config. On Ubuntu: `sudo make update-local`.
- Check to see if nginx is up (On Ubuntu) with `service nginx status`.

# Try it out

You can try it like this:

- Follow the above steps except for the editing.
- Start a server for the test web page (depends on Python) with: `make run-test-app`
- Open a browser to http://localhost:8000/test.html
- Click the "Make request" button.
- You should see a JSON response from Wikidata.
- If you run `tail /var/log/nginx/proxy-upstream-access.log`, you should see a log entry for the proxy request you made that includes the destination url that the proxy used.



Then:

    make update-local
