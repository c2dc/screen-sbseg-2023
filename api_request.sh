
import requests

def fetch_vulnerabilities(api_key, search_keyword):
    url = f"https://services.nvd.nist.gov/rest/json/cves/2.0?keywordSearch={search_keyword}"
    headers = {'apiKey': api_key}
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        return response.json()
    else:
        print(f"Erro ao buscar dados: {response.status_code}")
        return None

def extract_cve_id_and_exploit_url(data):
    cve_exploit_info = []
    for vulnerability in data.get("vulnerabilities", []):
        cve_id = vulnerability["cve"]["id"]
        for reference in vulnerability["cve"].get("references", []):
            if "Exploit" in reference.get("tags", []):
                exploit_url = reference.get("url")
                cve_exploit_info.append((cve_id, exploit_url))
    return cve_exploit_info

def save_to_file(vulnerabilities, filename):
    with open(filename, 'w') as file:
        for cve, url in vulnerabilities:
            file.write(f"{cve}, {url}\n")

# Configurações
API_KEY = '03c11277-327c-451e-921a-7f78018c336d'  # Substitua com sua chave de API real
SEARCH_KEYWORD = 'D-LINK'
OUTPUT_FILE = 'vulnerabilities.csv'

# Execução do Script
data = fetch_vulnerabilities(API_KEY, SEARCH_KEYWORD)
if data:
    vulnerabilities = extract_cve_id_and_exploit_url(data)
    save_to_file(vulnerabilities, OUTPUT_FILE)
    print(f"Arquivo '{OUTPUT_FILE}' criado com sucesso.")
else:
    print("Falha ao obter dados.")
