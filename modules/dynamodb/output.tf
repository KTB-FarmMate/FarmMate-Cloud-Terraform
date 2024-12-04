output "table_name" {
  description = "생성된 DynamoDB 테이블 이름"
  value       = aws_dynamodb_table.this.name
}

output "table_arn" {
  description = "생성된 DynamoDB 테이블의 ARN"
  value       = aws_dynamodb_table.this.arn
}

output "table_id" {
  description = "생성된 DynamoDB 테이블 ID"
  value       = aws_dynamodb_table.this.id
}