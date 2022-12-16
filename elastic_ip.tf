resource "aws_eip" "saieip" {
  
}
resource "aws_eip_association" "sai_eip_assoc" {
    instance_id = aws_instance.AWSEC2Instance.id
    allocation_id = aws_eip.saieip.id
}
  
