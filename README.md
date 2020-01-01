
![alt text](https://www.terraform.io/assets/images/logo-hashicorp-3f10732f.svg)

# **tf-module-cloudWatch**

Terraform module for creating Service Monitoring in ***cloudWatch***.

This module is service agnostic, allowing us to monitor a multitude of services such as:
- EC2
- SQS
- Lambda

 **Requirements**
 - Terraform
 - AWS Account

 **Dependencies**
 - AWS Services.

 **Example of Use**
 ------
```
module cloud_watch_metric_scaleup {
  source = "https://github.com/leandromoreirati/tf-module-cloudWatch.git"

  name       = "${var.my_team}-${var.product}-${var.environment}-scaleup"

  comparison_operator = "${var.comparison_operator}"
  metric_name         = "${var.metric_name}"
  namespace           = "${var.namespace}"
  period              = "${var.period}"
  evaluation_periods  = "${var.evaluation_periods}"
  statistic           = "${var.statistic}"
  threshold           = "${var.threshold_scaleup}"   
  treat_missing_data  = "${var.treat_missing_data}"   
  alarm_description   = "${var.alarm_description_scaleup}"   
  actions_enabled     = "${var.actions_enabled}"   
  alarm_actions       = "${var.alarm_actions}"   
  ok_actions          = "${var.ok_actions}"   
  insufficient_data_actions = "${var.insufficient_data_actions}"
  AutoScalingGroupName = "${"${module.auto_scaling_group.auto_scaling_group_name}"}"

  tags = {
    "Tag01" = "Value01"
    "Tag02" = "Value02"
    "Tag03" = "Value03"
    "Tag04" = "Value04"
  }
}
```
```
module cloud_watch_metric_scaledown {
  source = "https://github.com/leandromoreirati/tf-module-cloudWatch.git"

  name       = "${var.my_team}-${var.product}-${var.environment}-scaledown"

  comparison_operator = "${var.comparison_operator}"
  metric_name         = "${var.metric_name}"
  namespace           = "${var.namespace}"
  period              = "${var.period}"
  evaluation_periods  = "${var.evaluation_periods}"
  statistic           = "${var.statistic}"
  threshold           = "${var.threshold_scaledown}"   
  treat_missing_data  = "${var.treat_missing_data}"   
  alarm_description   = "${var.alarm_description_scaledown}"   
  actions_enabled     = "${var.actions_enabled}"   
  alarm_actions       = "${var.alarm_actions}"   
  ok_actions          = "${var.ok_actions}"   
  insufficient_data_actions = "${var.insufficient_data_actions}"
  AutoScalingGroupName = "${"${module.auto_scaling_group.auto_scaling_group_name}"}"

  tags = {
    "Name"           = "${var.my_team}-${var.product}-${var.environment}"
    "Application"    = "${var.my_team}-${var.product}"
    "Environment"    = "${var.environment}"
    "Service_type"   = "${var.service_type}"
    "Business_owner" = "${var.business_owner}"
  }
}

```

 **Variables**
 ------
 |          Nome                             |                      Descrição                                       |      Default     |
 |:-----------------------------------------:|----------------------------------------------------------------------|:----------------:|
 | comparison_operator                       | Mathematical operator used to compare metric statistics              |     ""           |
 | metric_name                               | Alarm Name Associated with Metric                                    |     ""           |
 | namespace                                 | Alarm namespace associated with metric                               | ""               |
 | period                                    | The period in seconds that the statistic is to be applied            |     ""           |
 | evaluation_periods                        | The number of periods to be evaluated                                |   ""             |
 | statistic                                 | The statistic that will be applied to the alarm                      |    Average       |
 | threshold_scaleup                         | The value at which the statistics will be compared (scaleup)         |     ""           |
 | threshold_scaledown                       | The value to which the statistics will be compared (scaledown)       |     ""           |
 | treat_missing_data                        | Defines how the alarm should handle missing data                     |   notBreaching   |
 | alarm_description_scaleup                 | Description of scaleup alarm                                         |     ""           |
 | alarm_description_scaledown               | Scaledown Alarm Description                                          | ""               |
 | actions_enabled                           | Defines whether or not actions should be performed on alarm          |     true         |
 | alarm_actions                             | List of actions to perform on alarm                                  |   ""             |
 | ok_actions                                | List of actions to perform on alarm OK                               |     ""           |
 | insufficient_data_actions                 | List of actions to take on INSUFFICIENT_DATA case                    |     ""           |
 | AutoScalingGroupName                      | Alarm dimension associated with metric                               |     ""           |

 **Outputs**
 ------
 |              Nome                  |                Valor                      |
 | -----------------------------------|:------------------------------------------|
 | cloudWatch_metrics_arn| aws_cloudwatch_metric_alarm.cloudwatch_metric_alarm.arn|
 | cloudWatch_metrics_id | aws_cloudwatch_metric_alarm.cloudwatch_metric_alarm.id |

 **External Documentation**
 - [AWS CloudWatch](https://docs.aws.amazon.com/pt_br/AmazonCloudWatch/latest/monitoring/cloudwatch_architecture.html)
 - [AWS CloudWatch All Metrics](https://docs.aws.amazon.com/pt_br/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html)
   - [EC2](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/viewing_metrics_with_cloudwatch.html)
   - [SQS](https://docs.aws.amazon.com/pt_br/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-available-cloudwatch-metrics.html)
   - [LAMBDA](https://docs.aws.amazon.com/pt_br/lambda/latest/dg/monitoring-functions-metrics.html)
 - [Terraform CloudWatch Metric Alarm](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html)

 **Created Resources**
 ------
 - CloudWatch Service Monitoring