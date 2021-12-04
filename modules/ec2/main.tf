resource "aws_instance" "cloud_web" {
  ami           = var.instance_ami
  instance_type = var.instance_size
 
  root_block_device {
    volume_size = var.instance_root_device_size
    volume_type = "gp3"
  }
 
  tags = {
    Name        = "cloud-${var.infra_env}-web"
    Role        = var.infra_role
    Project     = "cloud.io"
    Environment = var.infra_env
    ManagedBy   = "terraform"
  }
}
 
resource "aws_eip" "cloud_addr" {
  # We're not doing this directly
  # instance = aws_instance.cloud_web.id
  vpc      = true
 
  lifecycle {
    prevent_destroy = true
  }
 
  tags = {
    Name        = "cloud-${var.infra_env}-web-address"
    Role        = var.infra_role
    Project     = "cloud.io"
    Environment = var.infra_env
    ManagedBy   = "terraform"
  }
}
 
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.cloud_web.id
  allocation_id = aws_eip.cloud_addr.id
}