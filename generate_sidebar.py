import os
import urllib.parse

ignore_dirs = {'.git', '.github', 'output', 'docs', 'factor.docs', 'factor.index', 'factor.docs.freemarker.xmind', 'factor.docs.eclipse.snippets'}

def generate_sidebar():
    with open('factor.docs/_sidebar.md', 'w') as f:
        f.write('* [Home](/factor.docs/README.md)\n\n')
        f.write('* [FreeMarker Template Engineering](/factor.docs.freemarker.xmind/README.md)\n\n')
        f.write('* [Eclipse IDE Snippets Mastery](/factor.docs.eclipse.snippets/README.md)\n\n')
        
        dirs = [d for d in os.listdir('.') if os.path.isdir(d) and d not in ignore_dirs and not d.startswith('.')]
        dirs.sort()
        
        for d in dirs:
            f.write(f'* **{d}**\n')
            
            files = []
            for root, _, filenames in os.walk(d):
                for filename in filenames:
                    if filename.endswith('.md'):
                        files.append(os.path.relpath(os.path.join(root, filename), '.'))
            
            files.sort()
            for filepath in files:
                title = os.path.splitext(os.path.basename(filepath))[0]
                # Ensure the path uses forward slashes and spaces are encoded properly for markdown links, or just use literal
                # Docsify handles literal spaces in markdown links well if wrapped in < > or encoded, but standard markdown is %20
                url_path = urllib.parse.quote(filepath)
                f.write(f'  * [{title}](/{url_path})\n')
            
            f.write('\n')

generate_sidebar()
