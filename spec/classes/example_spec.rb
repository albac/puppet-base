require 'spec_helper'

describe 'base' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "base class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('base::params') }
          it { is_expected.to contain_class('base::install').that_comes_before('base::config') }
          it { is_expected.to contain_class('base::config') }
          it { is_expected.to contain_class('base::service').that_subscribes_to('base::config') }

          it { is_expected.to contain_service('base') }
          it { is_expected.to contain_package('base').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'base class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('base') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
