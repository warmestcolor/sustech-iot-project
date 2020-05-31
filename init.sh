export HEX_MIRROR="https://hexpm.upyun.com"
export HEX_CDN="https://hexpm.upyun.com"
mix deps.get
mix compile
echo "😀Compile Success"
export MIX_ENV=dev
mix ecto.create
mix ecto.migrate
echo "😀Migration Success"
echo "🐶Init Success"
