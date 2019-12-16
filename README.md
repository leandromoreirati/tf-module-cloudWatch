# **tf-module-cloudWatch**

Módulo Terraform para criação de Monitoramento de serviços no ***cloudWatch***.

Esse módulo e agnóstico ao serviço, nos permitindo monitorar uma infinidade de serviços, tais como:
- EC2
- SQS
- Lambda

E muitos outros serviços.

 **Requisitos**
 - Terraform
 - AWS Account

 **Dependências**
 - Serviços a serem monitorado.

 **Exemplo de Uso**
 ------
```
module cloud_watch_metric_scaleup {
  source = "../cloudWatch"

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
    "Name"           = "${var.my_team}-${var.product}-${var.environment}"
    "Application"    = "${var.my_team}-${var.product}"
    "Environment"    = "${var.environment}"
    "Service_type"   = "${var.service_type}"
    "Business_owner" = "${var.business_owner}"
  }
}
```
```
module cloud_watch_metric_scaledown {
  source = "../cloudWatch"

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

 **Variáveis**
 ------
 |          Nome                             |                      Descrição                                       |      Default     |
 |:-----------------------------------------:|----------------------------------------------------------------------|:----------------:|
 | comparison_operator                       | Operador matemático usado para comparar a estatística da métrica     |     ""           |
 | metric_name                               | Nome do alarme associado a métrica                                   |     ""           |
 | namespace                                 | Namespace do alarme associado a métrica                              | ""               |
 | period                                    | O período em segundos no qual a estatística deve ser aplicaca        |     ""           |
 | evaluation_periods                        | O númenro de períodos que serão avaliados                            |   ""             |
 | statistic                                 | A estatística que será aplicada ao alarme                            |    Average       |
 | threshold_scaleup                         | O valor no qual a estatistica será comparado (scaleup)               |     ""           |
 | threshold_scaledown                       | O valor no qual a estatistica será comparado (scaledown)             |     ""           |
 | treat_missing_data                        | Define como o alarme deve lidar com dados ausentes                   |   notBreaching   |
 | alarm_description_scaleup                 | Descrição do alarme scaleup                                          |     ""           |
 | alarm_description_scaledown               | Descrição do alarme scaledown                                        | ""               |
 | actions_enabled                           | Define se as ações devem ou nao ser executadas em caso de alarme     |     true         |
 | alarm_actions                             | Lista de ações a serem executadas em caso de alarme                  |   ""             |
 | ok_actions                                | Lista de ações a serem executadas em caso de alarme OK               |     ""           |
 | insufficient_data_actions                 | Lista de ações a serem executadas em caso INSUFFICIENT_DATA          |     ""           |
 | AutoScalingGroupName                      | Dimensão do alarme associada a métrica                               |     ""           |

 **Outputs**
 ------
 |              Nome                  |                Valor                      |
 | -----------------------------------|:------------------------------------------|
 | cloudWatch_metrics_arn| aws_cloudwatch_metric_alarm.cloudwatch_metric_alarm.arn|
 | cloudWatch_metrics_id | aws_cloudwatch_metric_alarm.cloudwatch_metric_alarm.id |

 **Documentação externa**
 - [AWS CloudWatch](https://docs.aws.amazon.com/pt_br/AmazonCloudWatch/latest/monitoring/cloudwatch_architecture.html)
 - [AWS CloudWatch All Metrics](https://docs.aws.amazon.com/pt_br/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html)
   - [EC2](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/viewing_metrics_with_cloudwatch.html)
   - [SQS](https://docs.aws.amazon.com/pt_br/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-available-cloudwatch-metrics.html)
   - [LAMBDA](https://docs.aws.amazon.com/pt_br/lambda/latest/dg/monitoring-functions-metrics.html)
 - [Terraform CloudWatch Metric Alarm](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html)

 **Recursos Criados**
 ------
 - Monitoramento de serviços no CloudWatch
