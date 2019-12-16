resource "aws_cloudwatch_metric_alarm" "cloudwatch_metric_alarm" {
  alarm_name          = "${var.name}"
  comparison_operator = "${var.comparison_operator}"
  metric_name         = "${var.metric_name}"
  namespace           = "${var.namespace}"
  period              = "${var.period}"
  evaluation_periods  = "${var.evaluation_periods}"
  statistic           = "${var.statistic}"
  
  threshold                 = "${var.threshold}"
  treat_missing_data        = "${var.treat_missing_data}"
  
  alarm_description         = "${var.alarm_description}."

  actions_enabled           = "${var.actions_enabled}"
  alarm_actions             = ["${var.alarm_actions}"]
  ok_actions                = ["${var.ok_actions}"]  
  insufficient_data_actions = []

  dimensions = {
    AutoScalingGroupName    = "${var.AutoScalingGroupName}"
  }

  tags = "${var.tags}"  
}