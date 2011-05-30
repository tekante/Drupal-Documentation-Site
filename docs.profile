<?php

function docs_profile_modules() {
  return array('menu', 'block');
}

function docs_profile_details() {
  return array(
    'name' => 'API Site',
    'description' => 'Create an API documentation site'
  );
}

function docs_profile_tasks(&$task, $url) {
  drupal_install_modules(array('ctools', 'grammar_parser', 'job_queue', 'api'));
}

function docs_form_alter(&$form, $form_state, $form_id) {
  if ($form_id == 'install_configure') {
    // Set default for site name field.
    $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
  }
}

