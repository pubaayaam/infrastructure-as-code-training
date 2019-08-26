{
    "version": 3,
    "terraform_version": "0.11.13",
    "serial": 1,
    "lineage": "4e3c04dd-1bfb-70aa-9e5f-759d7d42f5ab",
    "modules": [
        {
            "path": [
                "root"
            ],
            "outputs": {},
            "resources": {
                "aws_instance.example": {
                    "type": "aws_instance",
                    "depends_on": [],
                    "primary": {
                        "id": "i-0409fc6042a0e4ac5",
                        "attributes": {
                            "ami": "ami-009110a2bf8d7dd0a",
                            "arn": "arn:aws:ec2:ap-south-1:058566949740:instance/i-0409fc6042a0e4ac5",
                            "associate_public_ip_address": "true",
                            "availability_zone": "ap-south-1a",
                            "cpu_core_count": "1",
                            "cpu_threads_per_core": "1",
                            "credit_specification.#": "1",
                            "credit_specification.0.cpu_credits": "standard",
                            "disable_api_termination": "false",
                            "ebs_block_device.#": "0",
                            "ebs_optimized": "false",
                            "ephemeral_block_device.#": "0",
                            "get_password_data": "false",
                            "iam_instance_profile": "",
                            "id": "i-0409fc6042a0e4ac5",
                            "instance_state": "running",
                            "instance_type": "t2.micro",
                            "ipv6_address_count": "0",
                            "ipv6_addresses.#": "0",
                            "key_name": "",
                            "monitoring": "false",
                            "network_interface.#": "0",
                            "password_data": "",
                            "placement_group": "",
                            "primary_network_interface_id": "eni-0afe38aec874e5b69",
                            "private_dns": "ip-172-31-28-137.ap-south-1.compute.internal",
                            "private_ip": "172.31.28.137",
                            "public_dns": "ec2-52-66-121-250.ap-south-1.compute.amazonaws.com",
                            "public_ip": "52.66.121.250",
                            "root_block_device.#": "1",
                            "root_block_device.0.delete_on_termination": "true",
                            "root_block_device.0.encrypted": "false",
                            "root_block_device.0.iops": "100",
                            "root_block_device.0.kms_key_id": "",
                            "root_block_device.0.volume_id": "vol-05a4561efdd87525c",
                            "root_block_device.0.volume_size": "8",
                            "root_block_device.0.volume_type": "gp2",
                            "security_groups.#": "1",
                            "security_groups.3814588639": "default",
                            "source_dest_check": "true",
                            "subnet_id": "subnet-8a65bce2",
                            "tags.%": "1",
                            "tags.Name": "example",
                            "tenancy": "default",
                            "volume_tags.%": "0",
                            "vpc_security_group_ids.#": "1",
                            "vpc_security_group_ids.4046918199": "sg-bb2ec1d0"
                        },
                        "meta": {
                            "e2bfb730-ecaa-11e6-8f88-34363bc7c4c0": {
                                "create": 600000000000,
                                "delete": 1200000000000,
                                "update": 600000000000
                            },
                            "schema_version": "1"
                        },
                        "tainted": false
                    },
                    "deposed": [],
                    "provider": "provider.aws"
                }
            },
            "depends_on": []
        }
    ]
}
