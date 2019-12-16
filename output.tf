/* CLOUD WATCH MONITORING */
output "cloudWatch_metrics_arn" {
  value = "${aws_cloudwatch_metric_alarm.cloudwatch_metric_alarm.arn}"
}

output "cloudWatch_metrics_id" {
  value = "${aws_cloudwatch_metric_alarm.cloudwatch_metric_alarm.id}"
}
