import yaml
import pdfkit
import jinja2
from pathlib import Path

file_path = Path(__file__).parent
out_path = Path("resumes")
out_path.mkdir(exist_ok=True)

instructions = (file_path/"instructions.yml").read_text()
instructions = yaml.safe_load(instructions)

template = (file_path/"main.html").read_text()
template = jinja2.Template(template)

for pos, instruction in instructions.items():
    res = {
        "position": instruction["position"],
        "experience": (file_path/instruction["experience"]).read_text(),
        "skills": (file_path/instruction["skills"]).read_text()
    }

    res_html = template.render(res)
    html_file = out_path/(pos + ".html")
    pdf_file = out_path/(pos + ".pdf")

    html_file.write_text(res_html)
    pdfkit.from_string(
        res_html, str(pdf_file),
        options={"enable-local-file-access": ""}
    )
