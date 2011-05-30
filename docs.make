api = 2
core = 6.0

projects[drupal][type] = 'core'

projects[api][subdir] = 'contrib'
projects[api][type] = 'module'
projects[api][version] = '1.3'

projects[ctools][subdir] = 'contrib'
projects[ctools][type] = 'module'
projects[ctools][version] = '1.8'

projects[job_queue][subdir] = 'contrib'
projects[job_queue][type] = 'module'
projects[job_queue][version] = '3.1'

projects[grammar_parser][subdir] = 'contrib'
projects[grammar_parser][type] = 'module'
projects[grammar_parser][download][type] = 'git'
projects[grammar_parser][download][url] = 'http://git.drupal.org/project/grammar_parser.git'
projects[grammar_parser][download][tag] = '7.x-1.1'