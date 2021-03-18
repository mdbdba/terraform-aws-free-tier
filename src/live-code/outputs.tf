### The Ansible inventory file
resource "local_file" "ansible_inventory" {
  filename = "../../../plays/inventory/ec2_example_ubuntu_hosts.ini"
  content     = <<_EOF
[ubuntu]
${module.ec2.ec2_public_ip}
_EOF
}

resource "aws_s3_bucket_object" "file_upload" {
  bucket = "mdbstate-terraform-backend"
  key    = "ansible/inventory/ec2_example_ubuntu_hosts.ini"
  source = "../../../plays/inventory/ec2_example_ubuntu_hosts.ini"
  etag   = filemd5("../../../plays/inventory/ec2_example_ubuntu_hosts.ini")

  depends_on = [
    local_file.ansible_inventory,
  ]
}
