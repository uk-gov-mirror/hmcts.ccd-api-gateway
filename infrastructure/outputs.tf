output "api_gateway_web_deployment_endpoint" {
  value = "${module.api-gateway-web.gitendpoint}"
}

output "vaultUri" {
  value = "${data.azurerm_key_vault.ccd_shared_key_vault.vault_uri}"
}

output "vaultName" {
  value = "${local.vaultName}"
}

output "palo_alto_untrusted_ips" {
  value = "${module.palo_alto.untrusted_ips}"
}

output "palo_alto_untrusted_ips_fqdn" {
  value = "${module.palo_alto.untrusted_ips_fqdn}"
}
