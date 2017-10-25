control 'sshd-21' do
 title 'Set SSH Protocol to 2'
 desc 'This control ensures ssh daemons are only permitted to run version 2 of the protocol' 
 impact 1.0 # critical
 ref 'internal security policy 101', url: 'https://domain.tld/securitypolicy.pdf'
 
 describe sshd_config do
   its('Protocol') { should cmp 2 }
 end
end
