variable "name" {
  default = ""
  description = "Cloud Watch Alarm name."
}

variable "tags" {
  type    = "map"
  default = {}
  description = "Setting tags for the feature" 
}

variable "comparison_operator" {
  default = ""
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold."
}

variable "metric_name" {
  default = ""
  description = "The name for the alarm's associated metric."
}

variable "namespace" {
  default = ""
  description = "The namespace for the alarm's associated metric."
}

variable "period" {
  default = ""
  description = "The period in seconds over which the specified statistic is applied."
}

variable "evaluation_periods" {
  default = ""
  description = "The number of periods over which data is compared to the specified threshold."
}

variable "statistic" {
  default = "Average"
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum."
}
variable "threshold" {
  default = ""
  description = "The value against which the specified statistic is compared."
}

variable "alarm_description" {
  default = ""
  description = "The description for the alarm."
}

variable "treat_missing_data" {
  default = "notBreaching"
  description = "Sets how this alarm is to handle missing data points."
}

variable "actions_enabled" {
  default = "true"
  description = "Indicates whether or not actions should be executed during any changes to the alarm's state"
}

variable "alarm_actions" {
  default = []
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state. Set scales up value."
}

variable "ok_actions" {
  default = []
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state.Set scales down value."
}

variable "insufficient_data_actions" {
  default = []
  description = "The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state."
}

variable "AutoScalingGroupName" {
  default = ""
  description = "The list of actions to execute when this alarm transitions into an OK state from any other state."
}
