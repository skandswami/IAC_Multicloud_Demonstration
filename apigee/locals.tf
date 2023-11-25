locals {
    
    apigee_cluser_environments = {
    dev=[
        "dev",
        "qa",
        "uat",
        "uatr"
    ]
    prod = [
        "reg",
        "prod"
    ]
}
 subscriptions = {
    for subscription in data.azurerm_subscription.available.subscriptions
     : subscription.display_name => subscription_id
 }

apigee_environment = local.apigee_cluser_environments[var.cluster_environment]

target_servers = {
    ThirdPartyProduct1 = {
        dev = { host = "api-dev.product1.com", port = "443"}
        qa = { host = "api-qa.product1.com", port = "443"}
        uat = { host = "api-uat.product1.com", port = "443"}
        uatr = { host = "api-uatr.product1.com", port = "443"}
        reg = { host = "api-reg.product1.com", port = "443"}
        prod = { host = "api.product1.com", port = "443"}
    }
}

}