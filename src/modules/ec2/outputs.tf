output "ec2_id" {
  description = "The ID of the EC2"
  value       = concat(aws_instance.ec2.*.id, [""])[0]
}

output "ec2_arn" {
  description = "The ARN of the EC2"
  value       = concat(aws_instance.ec2.*.arn, [""])[0]
}

output "ec2_public_ip" {
  description = "The public IP of the EC2 instance"
  value  = concat(aws_instance.ec2.*.public_ip, [""])[0]
}