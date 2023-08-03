package com.home.expenditure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.home.expenditure.domain.Source;
import com.home.expenditure.service.SourceService;

@Controller
public class SourceController {

	@Autowired
	private SourceService sourceService;

	@GetMapping("/addsource")
	public String addSource(Model model) {
		reset(model);
		return "addSource";
	}

	@PostMapping("/addsource")
	public String addSource(@ModelAttribute("source") Source source, Model model) {
		sourceService.addSource(source);
		reset(model);
		return "addSource";
	}
	
	@PostMapping("/updatesource")
	public String updateSource(@ModelAttribute("source") Source source, Model model) {
		sourceService.updateSource(source);
		reset(model);
		return "addSource";
	}

	private void reset(Model model) {
		model.addAttribute("sourceList", sourceService.getSourceList());
		model.addAttribute("source", new Source());
	}
	
	@PostMapping("/deletesource")
	public String deleteSource(@ModelAttribute("source") Source source, Model model) {
		sourceService.deleteSource(source.getSourceId());
		reset(model);
		return "addSource";
	}
}
