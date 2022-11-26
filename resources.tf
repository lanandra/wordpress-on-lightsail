# Create lighstail instance with wordpress blueprint
resource "aws_lightsail_instance" "wp_lightsail_demo" {
  name              = "wp-lightsail-demo"
  availability_zone = var.availability_zone[0]
  blueprint_id      = var.wp_blueprint_id
  bundle_id         = var.bundle_id
  key_pair_name     = var.lightsail_key_pair

  tags = {
    Name                   = "wp-lightsail-demo"
    "lanandra:environment" = "Sandbox"
    "lanandra:owner"       = "Luthfi"
  }
}

resource "aws_lightsail_static_ip" "wp_lightsail_demo_static_ip" {
  name = "wp-lightsail-demo-static-ip"
}

resource "aws_lightsail_static_ip_attachment" "wp-lightsail-demo" {
  static_ip_name = aws_lightsail_static_ip.wp_lightsail_demo_static_ip.id
  instance_name  = "wp-lightsail-demo"

  depends_on = [
    aws_lightsail_instance.wp_lightsail_demo,
    aws_lightsail_static_ip.wp_lightsail_demo
  ]
}
