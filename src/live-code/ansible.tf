resource "ansible_host" "ec2_example" {
    inventory_hostname = module.ec2.ec2_public_ip
    groups = ["ubuntu"]
    # vars = {
    #     ansible_user = "admin"
    #}
}