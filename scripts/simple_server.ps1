$http = [System.Net.HttpListener]::new() 
$http.Prefixes.Add("http://localhost:8080/") 
$http.Start()
Write-Host "Serving at http://localhost:8080"
while ($http.IsListening) {
    $context = $http.GetContext()
    $path = ".\" + $context.Request.Url.LocalPath.TrimStart('/')
    if ($path -eq ".\") { $path = ".\index.html" }
    
    if (Test-Path $path) {
        $content = [System.IO.File]::ReadAllBytes($path)
        $ext = [System.IO.Path]::GetExtension($path)
        $mime = switch ($ext) {
            ".html" { "text/html; charset=utf-8" }
            ".css" { "text/css" }
            ".js" { "application/javascript" }
            ".jpg" { "image/jpeg" }
            ".png" { "image/png" }
            ".webp" { "image/webp" }
            Default { "application/octet-stream" }
        }
        $context.Response.ContentType = $mime
        $context.Response.OutputStream.Write($content, 0, $content.Length)
        $context.Response.Close()
    } else {
        $context.Response.StatusCode = 404
        $context.Response.Close()
    }
}
