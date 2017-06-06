# Bash-Funk "aws" module

[//]: # (THIS FILE IS GENERATED BY BASH-FUNK GENERATOR)

This module contains functions related to Amazon Web Services. It only loads if the aws commandline client is installed or the host is an EC2 instance.

The following commands are available when this module is loaded:

1. [-aws-account-id](#-aws-account-id)
1. [-aws-az](#-aws-az)
1. [-aws-describe-stack](#-aws-describe-stack)
1. [-aws-instance-id](#-aws-instance-id)
1. [-aws-is-ec2](#-aws-is-ec2)
1. [-aws-private-ip](#-aws-private-ip)
1. [-aws-region](#-aws-region)
1. [-aws-stack-name](#-aws-stack-name)
1. [-aws-vpc-cidr-block](#-aws-vpc-cidr-block)
1. [-aws-vpc-id](#-aws-vpc-id)
1. [-test-aws](#-test-aws)

## <a name="-aws-account-id"></a>-aws-account-id

```
Usage: -aws-account-id [OPTION]...

Prints this server's AWS account ID.

Options:
    --help 
        Prints this help.
    --selftest 
        Performs a self-test.
```

*Implementation:*
```bash
hash wget &>/dev/null && local get="wget -qO-" || local get="curl -s"

$get http://169.254.169.254/latest/dynamic/instance-identity/document | awk -F\" '/accountId/ {print $4}'
```


## <a name="-aws-az"></a>-aws-az

```
Usage: -aws-az [OPTION]...

Prints this server's AWS availability zone.

Options:
    --help 
        Prints this help.
    --selftest 
        Performs a self-test.
```

*Implementation:*
```bash
hash wget &>/dev/null && local get="wget -qO-" || local get="curl -s"

$get http://169.254.169.254/latest/meta-data/placement/availability-zone
```


## <a name="-aws-describe-stack"></a>-aws-describe-stack

```
Usage: -aws-describe-stack [OPTION]... [STACK_NAME]

Prints this server's AWS stack name. The server requires 'AmazonEC2ReadOnlyAccess' permission.

Requirements:
  + Command 'aws' must be available.

Parameters:
  STACK_NAME 
      Name of the stack to describe.

Options:
    --help 
        Prints this help.
    --region ID 
        AWS region.
    --selftest 
        Performs a self-test.
```

*Implementation:*
```bash
hash wget &>/dev/null && local get="wget -qO-" || local get="curl -s"

if [[ ! $_region ]]; then
    local _region=$($get http://169.254.169.254/latest/dynamic/instance-identity/document | awk -F\" '/region/ {print $4}')
fi

if [[ ! $_STACK_NAME ]]; then
    local instanceId=$($get http://169.254.169.254/latest/meta-data/instance-id)
    local _STACK_NAME=$(aws ec2 describe-instances --region $_region --instance-id $instanceId --query 'Reservations[*].Instances[*].Tags[?Key==`aws:cloudformation:stack-name`].Value' --output text)
fi

aws --region $_region cloudformation describe-stacks --stack-name $_STACK_NAME 2>&1
```


## <a name="-aws-instance-id"></a>-aws-instance-id

```
Usage: -aws-instance-id [OPTION]...

Prints this server's AWS instance ID.

Options:
    --help 
        Prints this help.
    --selftest 
        Performs a self-test.
```

*Implementation:*
```bash
hash wget &>/dev/null && local get="wget -qO-" || local get="curl -s"

$get http://169.254.169.254/latest/meta-data/instance-id
```


## <a name="-aws-is-ec2"></a>-aws-is-ec2

```
Usage: -aws-is-ec2 [OPTION]...

Determins if this server is an EC2 instance.

Options:
    --help 
        Prints this help.
    --selftest 
        Performs a self-test.
-v, --verbose 
        Prints additional information during command execution.
```

*Implementation:*
```bash
if [[ -f /sys/hypervisor/uuid && $(head -c 3 /sys/hypervisor/uuid) == "ec2" ]]; then
    [[ $_verbose ]] && echo "This is an AWS EC2 instance." || true
    return 0
else
    [[ $_verbose ]] && echo "This is no AWS EC2 instance." || true
    return 1
fi
```


## <a name="-aws-private-ip"></a>-aws-private-ip

```
Usage: -aws-private-ip [OPTION]...

Prints this server's AWS private IP address.

Options:
    --help 
        Prints this help.
    --selftest 
        Performs a self-test.
```

*Implementation:*
```bash
hash wget &>/dev/null && local get="wget -qO-" || local get="curl -s"

$get http://169.254.169.254/latest/dynamic/instance-identity/document | awk -F\" '/privateIp/ {print $4}'
```


## <a name="-aws-region"></a>-aws-region

```
Usage: -aws-region [OPTION]...

Prints this server's AWS region.

Options:
    --help 
        Prints this help.
    --selftest 
        Performs a self-test.
```

*Implementation:*
```bash
hash wget &>/dev/null && local get="wget -qO-" || local get="curl -s"

$get http://169.254.169.254/latest/dynamic/instance-identity/document | awk -F\" '/region/ {print $4}'
```


## <a name="-aws-stack-name"></a>-aws-stack-name

```
Usage: -aws-stack-name [OPTION]...

Prints this server's AWS stack name. The server requires 'AmazonEC2ReadOnlyAccess' permission.

Requirements:
  + Command 'aws' must be available.

Options:
    --help 
        Prints this help.
    --selftest 
        Performs a self-test.
```

*Implementation:*
```bash
hash wget &>/dev/null && local get="wget -qO-" || local get="curl -s"

local region=$($get http://169.254.169.254/latest/dynamic/instance-identity/document | awk -F\" '/region/ {print $4}')
local instanceId=$($get http://169.254.169.254/latest/meta-data/instance-id)
aws ec2 describe-instances --region $region --instance-id $instanceId --query 'Reservations[*].Instances[*].Tags[?Key==`aws:cloudformation:stack-name`].Value' --output text
```


## <a name="-aws-vpc-cidr-block"></a>-aws-vpc-cidr-block

```
Usage: -aws-vpc-cidr-block [OPTION]...

Prints this server's AWS VPC CIDR Block.

Options:
    --help 
        Prints this help.
    --selftest 
        Performs a self-test.
```

*Implementation:*
```bash
hash wget &>/dev/null && local get="wget -qO-" || local get="curl -s"

$get http://169.254.169.254/latest/meta-data/network/interfaces/macs/$($get http://169.254.169.254/latest/meta-data/mac)/vpc-ipv4-cidr-block
```


## <a name="-aws-vpc-id"></a>-aws-vpc-id

```
Usage: -aws-vpc-id [OPTION]...

Prints this server's AWS VPC ID.

Options:
    --help 
        Prints this help.
    --selftest 
        Performs a self-test.
```

*Implementation:*
```bash
hash wget &>/dev/null && local get="wget -qO-" || local get="curl -s"

$get http://169.254.169.254/latest/meta-data/network/interfaces/macs/$($get http://169.254.169.254/latest/meta-data/mac)/vpc-id
```


## <a name="-test-aws"></a>-test-aws

```
Usage: -test-aws [OPTION]...

Performs a selftest of all functions of this module by executing each function with option '--selftest'.

Options:
    --help 
        Prints this help.
    --selftest 
        Performs a self-test.
```

*Implementation:*
```bash
-aws-account-id --selftest && echo || return 1
-aws-az --selftest && echo || return 1
-aws-describe-stack --selftest && echo || return 1
-aws-instance-id --selftest && echo || return 1
-aws-is-ec2 --selftest && echo || return 1
-aws-private-ip --selftest && echo || return 1
-aws-region --selftest && echo || return 1
-aws-stack-name --selftest && echo || return 1
-aws-vpc-cidr-block --selftest && echo || return 1
-aws-vpc-id --selftest && echo || return 1
```


## <a name="license"></a>License

Copyright (c) 2015-2017 Vegard IT GmbH, http://vegardit.com

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
