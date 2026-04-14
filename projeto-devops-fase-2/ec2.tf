resource "aws_instance" "website_server" {
  ami                    = "ami-051de6a4e7ae45f77" # Amazon Linux 2
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.minha_key.key_name
  vpc_security_group_ids = [aws_security_group.website_sg.id]
  subnet_id              = aws_subnet.public.id
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name




  tags = {
    Name        = "website-server"
    provisioned = "terraform"
    cliente     = "Adonys"
  }
}

#comando para criar a chave 
#ssh-keygen -t rsa -b 2048 -f minha-chave 


#Security group
resource "aws_security_group" "website_sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name        = "website-sg"
    provisioned = "terraform"
    cliente     = "Adonys"
  }
}

#Regras de entrada
resource "aws_vpc_security_group_ingress_rule" "allow-ssh" {
  security_group_id = aws_security_group.website_sg.id

  cidr_ipv4   = "179.181.102.25/32"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow-http" {
  security_group_id = aws_security_group.website_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow-https" {
  security_group_id = aws_security_group.website_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}

#regra de saida
resource "aws_vpc_security_group_egress_rule" "example" {
  security_group_id = aws_security_group.website_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1 #todos os protocolos

}
