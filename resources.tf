# Create lighstail instance with wordpress blueprint
resource "aws_lightsail_instance" "wp_lighstail_demo" {
  name              = "wp-lighstail-demo"
  availability_zone = var.availability_zone[0]
  blueprint_id      = var.wp_blueprint_id
  bundle_id         = var.bundle_id
  key_pair_name     = var.lightsail_key_pair

  tags = {
    Name                   = "wp-lighstail-demo"
    "lanandra:environment" = "Sandbox"
    "lanandra:owner"       = "Luthfi"
  }
}

resource "aws_lightsail_static_ip" "wp_lighstail_demo" {
  name = "wp-lighstail-demo"
}

resource "aws_lightsail_static_ip_attachment" "wp_lighstail_demo" {
  static_ip_name = aws_lightsail_static_ip.wp_lighstail_demo.id
  instance_name  = "wp-lighstail-demo"
}
