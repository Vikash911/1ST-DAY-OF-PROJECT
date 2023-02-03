resource "aws_instance" "ec2_launch" {
	count = 1
	ami ="ami-0036b4598ccd42565"
	instance_type="t2.micro"
	subnet_id="subnet-096b06af407a8f519"
	availability_zone="us-west-1c"
	key_name="k8s_server"
	vpc_security_group_ids=["sg-017e362c667617140"]
 	tags = {
		Name="os1"
		}
}


