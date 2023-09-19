import json
import requests
import sys

def get_exploit_urls(data):
    exploit_urls = []
    vulnerabilities = data.get("vulnerabilities", [])
    for vulnerability in vulnerabilities:
        references = vulnerability.get("references", [])
        for reference in references:
            if "Exploit" in reference.get("tags", []):
                exploit_urls.append(reference["url"])
    return exploit_urls

if len(sys.argv) < 2:
    print("Por favor, forneça o ID CVE como argumento.")
    sys.exit(1)

cve_id = sys.argv[1]

# Etapa 1: Fazer uma requisição HTTP para obter o JSON
url = f"https://services.nvd.nist.gov/rest/json/cves/2.0?cveId={cve_id}"
response = requests.get(url)
data = response.json()

# Etapa 2: Analisar o JSON e extrair a URL
exploit_urls = get_exploit_urls(data)

# Etapa 3: Fazer uma requisição HTTP para a URL extraída
for url in exploit_urls:
    response = requests.get(url)
    # Aqui você pode salvar o conteúdo da resposta ou fazer o que precisar com ele
    # Por exemplo, para salvar o conteúdo em um arquivo:
    with open(f"exploit_content_{cve_id}.txt", "a") as file:
        file.write(response.text)

# Etapa 4: Imprimir uma mensagem para o operador
print("Operador, analise o exploit e transforme-o em template.")


