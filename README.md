# Iot

## Start A

  * start server `start.sh`
  ```shell
  sudo chmod 755 start.sh
  sudo ./start.sh
  ```
  * stop server
  ```shell
  netstat -vant | grep 4000
  # 找到 4000 端口号对应的 pid
  sudo kill pid
  ```

## Start B
  * init project
  ```shell
  sudo chmod 755 init.sh
  sudo ./init.sh
  ```

  * start server
  ```shell
  mix phx.server
  ```

  * stop server
  Press Control + C (2 times)


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
