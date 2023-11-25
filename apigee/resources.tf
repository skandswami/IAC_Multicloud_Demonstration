resource "apigee_target_server" "AlphaOneApiProxies" {
    for_each = toset(local.apigee_cluser_environments)

    environment_name = "alpha_one_${each.key}"
    name             = "API_Marketplace"
    host             = local.target_servers.ThirdPartyProduct1[each.key].host
    port             = local.target_servers.ThirdPartyProduct1[each.key].port
    is_enabled       = true
}

resource "apigee_product" "Basic" {
    name = "basic"
    display_name = "Basic"
    auto_approval_type = true
    description = "Limited set of API endpoints can be queried using the basic subscription"
    environments= local.api_products.environment[var.cluster_environment]
    scopes = [
        "openid",
        "profile"
    ]
    operations {
        api_source = "product1"
        path = "/"
        methods = ["GET"]
    }
}