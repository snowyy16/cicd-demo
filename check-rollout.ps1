# giám sát rollout trong 10s nếu gặp lỗi sẽ tự rollback về phiên bản trước
kubectl rollout status deployment/cicd-demo-deployment --timeout=10s; if (-not $?) { kubectl rollout undo deployment/cicd-demo-deployment }
