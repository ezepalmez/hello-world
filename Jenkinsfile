pipeline {
  agent any
  parameters {
        string(name: 'name_container', defaultValue: 'container-hello-world', description: 'nombre del docker')
        string(name: 'name_imagen', defaultValue: 'image-hello-world', description: 'nombre de la imagen')
        string(name: 'tag_imagen', defaultValue: 'latest', description: 'etiqueta de la imagen')
        string(name: 'puerto_imagen', defaultValue: '8081', description: 'puerto a publicar')
    }
    environment {
        name_final = "${name_container}${5}${tag_imagen}${5}${puerto_imagen}"        
    }
    stages {
          stage('stop/rm') {
            when {
                expression { 
                    DOCKER_EXIST = sh(returnStdout: true, script: 'echo "$(docker ps -q --filter name=${name_final})"').trim()
                    return  DOCKER_EXIST != '' 
                }
            }
            steps {
                script{
                    sh ''' 
                         docker stop ${name_final}
                    '''
                }   
            }                                           
          }
           
        stage('build') {
            steps {
                script{
                    sh ''' 
                    docker build . -t ${name_imagen}:${tag_imagen}
                    '''
                }
                    
            }                    
                                  
        }
            stage('run') {
                steps {
                    script{
                        sh ''' 
                            docker run -dp ${puerto_imagen}:10000 --name ${name_final} ${name_imagen}:${tag_imagen}
     
                        '''
                    }
                }                                                      
            }         
    }   
}
