package k8sazurenamedserviceaccount

violation[{"msg": msg}] {
  obj := input.review.object
  not valid_service_account(obj.spec)
  msg := sprintf("A service account must be used with deployed resources: Automounting service account token is disallowed, pod: %v", [obj.metadata.name])
}

valid_service_account(spec) {
  spec.serviceAccountName
  spec.automountServiceAccountToken == false
}
