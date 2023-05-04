class unicorn::services (
  $services = {},
) {
  include ::unicorn
  create_resources('unicorn', $services)
}
