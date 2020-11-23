$b64txt = kubectl get secret mygitlab-gitlab-initial-root-password -ojsonpath='{.data.password}'
$byte = [System.Convert]::FromBase64String($b64txt)
$txt = [System.Text.Encoding]::Default.GetString($byte)
# echo $b64txt
echo $txt
