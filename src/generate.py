import os
import yaml
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

    res = template.render(res)
    (out_path/(pos + ".html")).write_text(res)
