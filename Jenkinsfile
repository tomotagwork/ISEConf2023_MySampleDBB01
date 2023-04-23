// variables for Git
def srcGitRepo = null
def srcGitBranch = null
def srcGitCredentialsId = null
def srcGitRepoName = null

// variables for DBB, zAppBuild
def dbbHome = null
def zAppBuildHome = null
def dbbBuildExtraOpts = null

pipeline {
   agent {label 'wazi01'}

   options {
      skipDefaultCheckout(true)
   }

   stages {
      stage('Git Clone'){
         steps {
            script {
               // variables for Git
               srcGitRepo = scm.getUserRemoteConfigs()[0].getUrl()
               srcGitBranch = scm.branches[0].name
               srcGitCredentialsId = scm.getUserRemoteConfigs()[0].getCredentialsId()
               srcGitRepoName = srcGitRepo.tokenize('/').last().tokenize('\\.')[0]

               dir(srcGitRepoName){
                  /*sh """
                     echo 'srcGitRepo: ' $srcGitRepo
                     echo 'srcGitBranch: ' $srcGitBranch
                     echo 'srcGitCredentialsId: ' $srcGitCredentialsId
                     echo 'srcGitRepoName: ' $srcGitRepoName
                  """*/
                  def scmVars = checkout([
                     $class: 'GitSCM',
                     branches: [[name: srcGitBranch]],
                     userRemoteConfigs: [[ credentialsId: srcGitCredentialsId, url: srcGitRepo ]]
                  ])
               }
            }
         }
      }
      stage('Hello') {
         steps {
            echo 'Hello World'
         }
      }
      stage('Build'){
         steps {
            script {
               // variables for DBB, zAppBuild
               dbbHome = env.DBB_HOME
               zAppBuildHome = env.ZAPPBUILD_HOME
               dbbBuildExtraOpts = env.DBB_BUILD_EXTRA_OPTS

               sh """
                  $dbbHome/bin/groovyz $zAppBuildHome/build.groovy \
                     $dbbBuildExtraOpts  \
                     --logEncoding UTF-8 \
                     --workspace ${WORKSPACE} \
                     --application $srcGitRepoName \
                     --hlq JENKIN1.DBB \
                     --outDir /u/JENKIN1/logs \
                     --fullBuild
               """
            }
         }
      }
      stage('Test'){
          steps{
              echo 'Test Dummy'
          }
      }
      stage('Deploy'){
          steps{
              echo 'Deploy Dummy'
          }
      }
   }
}
