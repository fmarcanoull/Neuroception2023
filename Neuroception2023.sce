scenario_type = fMRI; #fMRI_emulation;

$TR = 553;# ms
$pulsosPorVolumenDeImagen = 1; 
pulse_code = 30;

scan_period = $TR; # Ignorado cuando scenario_type = fMRI
pulses_per_scan = $pulsosPorVolumenDeImagen; 

$fichero_video = "tiburon.avi";
$texto_esperando_pulso = "Esperando pulso DYNOT";
$color_font = "64,64,64";

begin;

trial{
	stimulus_event{
		picture{
			text{
				caption = $texto_esperando_pulso;
				font_size = 40;
				font_color = "255,255,255";
				preload = true;
			};
			x=0;y=0;
		};
		code = "esperandoPulso";
	};
} trial_mensaje_espera_pulso;
	
trial{
	trial_mri_pulse = 10;
}trial_pulso;
trial{
	stimulus_event{
		video{
			filename = $fichero_video;
		} vid;
		code = "video";
	};
} trial_video;

begin_pcl;
	
	trial_mensaje_espera_pulso.present();
	
	trial_pulso.present();
	
	trial_video.present();
